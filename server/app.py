from flask import Blueprint, jsonify
# import logging

bp = Blueprint("errors", __name__, url_prefix = '/error')

@bp.route('/500', methods = ['GET'])
def serve500():
    '''
    '''
    return jsonify({"message": "this is a 500 response"}), 500

@bp.route('/501', method = ['GET'])
def serve501():
    '''
    '''
    return jsonify({"message": "this is a 501 response"}), 501

@bp.route('/502', method = ['GET'])
def serve502():
    '''
    '''
    return jsonify({"message": "this is a 502 response"}), 502

@bp.route('/503', method = ['GET'])
def serve503():
    '''
    '''
    return jsonify({"message": "this is a 503 response"}), 503

@bp.route('/504', method = ['GET'])
def serve504():
    '''
    '''
    return jsonify({"message": "this is a 504 response"}), 504

@bp.route('/505', method = ['GET'])
def serve505():
    '''
    '''
    return jsonify({"message": "this is a 505 response"}), 505
